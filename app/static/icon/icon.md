考虑使用在线加载图标增强网站性能

进入网站,找到我的项目,复制在线链接,
https://www.iconfont.cn/?spm=a313x.7781069.1998910419.d4d0a486a


第一种：Unicode
要在本地CSS文件加入下面这段话
@font-face {
  font-family: 'iconfont';  /* project id 813467 */
  src: url('//at.alicdn.com/t/font_813467_iwr2cp7z8mo.eot');
  src: url('//at.alicdn.com/t/font_813467_iwr2cp7z8mo.eot?#iefix') format('embedded-opentype'),
  url('//at.alicdn.com/t/font_813467_iwr2cp7z8mo.woff2') format('woff2'),
  url('//at.alicdn.com/t/font_813467_iwr2cp7z8mo.woff') format('woff'),
  url('//at.alicdn.com/t/font_813467_iwr2cp7z8mo.ttf') format('truetype'),
  url('//at.alicdn.com/t/font_813467_iwr2cp7z8mo.svg#iconfont') format('svg');
}

第二种：Font class
在线或本地文件引入css文件
<link href="https://at.alicdn.com/t/font_813467_iwr2cp7z8mo.css" rel="stylesheet">
然后编写i标签引入
<i class="iconfont icon-youiconname"></i>
