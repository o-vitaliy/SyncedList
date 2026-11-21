// Usage: node render.js out.mp4 [fps]   |  node render.js --stills dir t1,t2,...
const puppeteer = require('puppeteer-core');
const ffmpeg = require('ffmpeg-static');
const { spawn } = require('child_process');
const path = require('path');

(async () => {
  const browser = await puppeteer.launch({
    executablePath: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    headless: true,
  });
  const page = await browser.newPage();
  const vert = process.argv.includes("vertical");
  await page.setViewport({ width: vert ? 1080 : 1920, height: vert ? 1920 : 1080, deviceScaleFactor: 1 });
  await page.goto('file://' + path.join(__dirname, 'promo.html') + (vert ? "?format=vertical&t=0" : "?t=0"), { waitUntil: 'networkidle0' });
  await page.evaluate(() => document.fonts.ready);

  if (process.argv[2] === '--stills') {
    const dir = process.argv[3];
    for (const t of process.argv[4].split(',').map(Number)) {
      await page.evaluate(t => render(t), t);
      await page.screenshot({ path: path.join(dir, `still_${t}.png`) });
    }
    await browser.close();
    return;
  }

  const out = process.argv[2];
  const fps = Number(process.argv[3] || 30);
  const duration = await page.evaluate(() => window.DURATION);
  const frames = Math.round(duration * fps);
  const ff = spawn(ffmpeg, ['-y', '-f', 'image2pipe', '-framerate', String(fps), '-i', '-',
    '-c:v', 'libx264', '-pix_fmt', 'yuv420p', '-crf', '18', '-preset', 'medium', '-movflags', '+faststart', out],
    { stdio: ['pipe', 'ignore', 'inherit'] });
  for (let i = 0; i < frames; i++) {
    await page.evaluate(t => render(t), i / fps);
    const buf = await page.screenshot({ type: 'png' });
    if (!ff.stdin.write(buf)) await new Promise(r => ff.stdin.once('drain', r));
    if (i % 60 === 0) process.stderr.write(`frame ${i}/${frames}\n`);
  }
  ff.stdin.end();
  await new Promise(r => ff.on('close', r));
  await browser.close();
  console.log('done', out);
})();
