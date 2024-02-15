function drawRainbow(containerId, colors, sizeIncrement) {
  const rainbowContainer = document.getElementById(containerId);
  const baseSize = 20; // 1層目のサイズ

  for (let i = 0; i < colors.length; i++) {
      let circle = document.createElement('div');
      circle.className = 'layer';
      const size = baseSize + i * sizeIncrement;
      circle.style.width = `${size}px`;
      circle.style.height = `${size}px`;
      circle.style.backgroundColor = colors[i];
      circle.style.position = 'absolute';
      circle.style.marginTop = `-${size / 2}px`; // 中心に配置
      circle.style.marginLeft = `-${size / 2}px`; // 中心に配置
      circle.style.zIndex = colors.length - i;
      rainbowContainer.appendChild(circle);
  }
}
