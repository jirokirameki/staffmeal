// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require gmaps/google
//= require underscore

// page topボタン
$(function(){
  var topBtn=$('#pageTop');
  topBtn.hide();

  //◇ボタンの表示設定
  $(window).scroll(function(){
    if($(this).scrollTop()>160){
      //---- 画面を160pxスクロールしたら、ボタンを表示する
      topBtn.fadeIn();
    }else{
      //---- 画面が160pxより上なら、ボタンを表示しない
      topBtn.fadeOut();
    } 
  });
  // ◇ボタンをクリックしたら、スクロールして上に戻る
  topBtn.click(function(){
    $('body,html').animate({
    scrollTop: 0},750);
    return false;
  });
});

//cameraボタン
// $(function(){
//   var topBtn=$('#camera');
//   topBtn.hide();

//   //◇ボタンの表示設定
//   $(window).scroll(function(){
//     if($(this).scrollTop()>160){
//       //---- 画面を160pxスクロールしたら、ボタンを表示する
//       topBtn.fadeIn();
//     }else{
//       //---- 画面が160pxより上なら、ボタンを表示しない
//       topBtn.fadeOut();
//     } 
//   });
// });

// postするimageのプレビューなど
$(document).on('change', ':file', function() {
  var input = $(this),
  numFiles = input.get(0).files ? input.get(0).files.length : 1,
  label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
  input.parent().parent().next(':text').val(label);

  var files = !!this.files ? this.files : [];
  if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
    if (/^image/.test( files[0].type)){ // only image file
      var reader = new FileReader(); // instance of the FileReader
      reader.readAsDataURL(files[0]); // read the local file
      reader.onloadend = function(){ // set image data as background of div
      input.parent().parent().parent().prev('.imagePreview').css("background-image", "url("+this.result+")");

      $('.existing-img').remove();
      $('.imagePreview').css({'height':'180px'});
    }
  }
});