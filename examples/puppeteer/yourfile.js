const puppeteer = require('puppeteer');

(async () => {
  args2chrome = {
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox'
    ]
  };
  const browser = await puppeteer.launch(args2chrome);
  const page = await browser.newPage();
  await page.goto('https://www.google.com');

  // Get the "viewport" of the page, as reported by the page.
  const dimensions = await page.evaluate(() => {
    return {
      width: document.documentElement.clientWidth,
      height: document.documentElement.clientHeight,
      deviceScaleFactor: window.devicePixelRatio
    };
  });

  console.log('Dimensions:', dimensions);
  await page.screenshot({path: 'screenshot.png'});

  await browser.close();
})();
