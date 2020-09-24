if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('item-list');
    document.getElementById('item-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');

      // 画像を表示するためのimg要素を生成
      const blobImage = document.createElement('img');
       // 表示する画像を生成
      blobImage.setAttribute('src', blob);

      // ImageListの中身の確認
      // console.log(ImageList);   

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    
      // console.log(blob);
      // console.log(blobImage);
    });
  });
}