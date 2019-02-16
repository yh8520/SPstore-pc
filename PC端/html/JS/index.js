// //轮播
// //每隔3秒，将当前class为show的img上的class换到下一个img
// function task(){
// var show=document.querySelector("#banner>a.show");
// show.className="";
// bian(show,"show");
// function bian(bian,clas){
// if(bian.nextElementSibling!==null)
//     bian.nextElementSibling.className=clas;
// else
//     bian.parentNode.children[0].className=clas;
// }
// var a=document.querySelector("#banner_a>div>a.active1");
// a.className="";
// bian(a,"active1")
// }
// var n=setInterval(task,3000)
// var div=document.getElementById("banner")
//   div.onmouseover=function(){
//     clearInterval(n)
//   }
//   div.onmouseout=function(){
//     n=setInterval(task,3000)
// }

//活动倒计时
function times(){
  var end=new Date("2019/2/2 18:00:00");
  var now=new Date();
  var s=parseInt((end-now)/1000);
  var div=document.querySelectorAll(".times")
  if(s>0){
    var d=parseInt(s/3600/24);
    if(d<10) d="0"+d;
    //s/3600/24,再下取整
    var h=parseInt(s%(3600*24)/3600);
    if(h<10) h="0"+h;
    //s/(3600*24)的余数,再/3600,再下去整
    var m=parseInt(s%3600/60);
    if(m<10) m="0"+m;
    //s/3600的余数,再/60，再下取整
    s%=60;//s/60的余数
    if(s<10) s="0"+s;
    // span.innerHTML=//拼结果字符串，放到页面上
    //   d+"天"+h+"小时"+m+"分"+s+"秒";
   div[0].innerHTML=`<b style="color:white">${h}</b>`
   div[1].innerHTML=`<b style="color:white">${m}</b>`
   div[2].innerHTML=`<b style="color:white">${s}</b>`
  }
}
setInterval(times,1000);



$.ajax({
  url:"http://127.0.0.1:3000/index/index",
  type:"get",
  dataType:"json"
}).then(data=>{
  var html="";
  for(var p of data){
      html+=`<a href="${p.href}"><img src="${p.img}"></a>`
  } 
  $("#ban>div:first-child").html(html);
  var html="";
  for(var p of data){
      html+=`<a href="#">${p.title}</a>`
  }
  $("#banner_a>div:first-child").html(html);
  var interval=3000,timer=null;
  var $imglist=$("#ban>div:first-child>a");
  var $lilist=$("#banner_a a");
  $imglist.first().addClass("show");
  $lilist.first().addClass("active1");
  var index=0;
  function trans(){
      $imglist.eq(index).addClass("show").siblings().removeClass("show");
      $lilist.eq(index).addClass("active1").siblings().removeClass("active1");
  }
  function lunbo(){
      index++;
      (index>=data.length)&&(index=0);
      trans();
  }
  timer=setInterval(lunbo,interval);
  $("#banner_a").hover(
      function(){
          clearInterval(timer);
          timer=null;
      },
      function(){
          timer=setInterval(lunbo,interval);
      }
  );
 $("#banner_a").on("mouseover","a",(e)=>{
  var tar=$(e.target);
  index=tar.index();
  trans();
 });  
})

$.ajax({
  url:"http://127.0.0.1:3000/index/product",
  type:"get",
  dataType:"json"
}).then(data=>{
  var html="";
  html+=`<li class="x_li">
  <div class="cont_area">
      <h1 class="white">超级单品</h1>
      <a href="#" class="white">限时</a>
      <a href="#" class="white">限量</a>
      <a href="#" class="white">品质</a>
      <a href="#" class="white">超值</a>
      <p  class="white m"><img src="yhd_img/nao.png" alt="">距结束仅剩</p>
          <div class="times div1"></div>
          <span class="hover1">:</span>
          <div class="times div2"></div>
          <span class="hover2">:</span>
          <div class="times div3"></div>
  </div>
</li>`
  for(var item of data){
    html+=`<li class="x_li2">
    <a href="${item.href}">
        <img src="${item.pic}" alt="">
        <div class="pro">
            <div style='width:50%' class="progress"></div>
        </div>
        <p class="my_small yc">${item.details}</p>
        <span class="red bold">￥${item.price}</span>
        <span class="gray my_small through">￥${item.old_price}</span>
    </a>
</li>`
  }
  $(".x_one>ul").html(html);
//二维码的现实和隐藏
window.onscroll=function(){
    var scrollTop=document.body.scrollTop||document.documentElement.scrollTop
    if(scrollTop>=500)
    {
      {
        wc_lan.style.display="block";
      topNav.style.display="block";
      }
    }
    else
    {
      wc_lan.style.display="none";
    topNav.style.display="none";
    }
  }

  var moved=0;
    $(".arrow_r").addClass("disabled");
  $(".arrow_r").click(function(e){
    e.preventDefault();
      if(!$(this).is(".disabled")){
        moved++;
        $(".arrow_r").css("margin-left",-38*moved);
        $(".arrow_l").removeClass("disabled");
        if(moved==$(".yidong_img>ul").length-4){
          $(this).addClass("disabled");
        }
      }
  })  

$.ajax({
  url:"http://127.0.0.1:3000/index/super",
  type:"get",
  dataType:"json"
}).then(result=>{
  console.log(result)
  var html=`<a href="#"><h2 class="hn my_blue">超级品牌</h2></a>
  <a href="#" class="my_blue">/超级品牌</a>
  <a href="#" class="my_blue">/精品汇聚</a>`
  for(var i=0;i<2;i++){
    console.log(result[i].img1)
  html+=`
          <div class="bg_img${i+1} tong">
             <div>
                  <a href="#"><img src="${result[i].pic}" alt="" class="yuan"></a>
              </div>
              <div class="white">
                   <span><h2>${result[i].title}</h2></span>
                   <p>${result[i].aattr}</p>
                    <a href="#" class="bg_a">进入</a>
              </div>
              <div class="hover_img">
                  <a href="#"><img src="${result[i].img1}" alt=""></a>
                  <a href="#"><img src="${result[i].img2}" alt=""></a>
                  <a href="#"><img src="${result[i].img3}" alt=""></a>
              </div> 
          </div>
          `
  }
  
$(".supper>.div1").html(html)

var html=`<a href="#"><h2 class="hn my_blue">超级品类</h2></a>
<a href="#" class="my_blue">/超级品类</a>
<a href="#" class="my_blue">/品质甄选</a>`
  for(var i=2;i<4;i++){
  html+=`<div class="bg_img${i+1} tong">
  <div class="white">
       <span><h2>${result[i].title}</h2></span>
       <p>${result[i].aattr}</p>
      <a href="#" class="bg_a">进入</a>
  </div>
  <div class="hover_img">
      <a href="http://127.0.0.1:5500/details.html?lid=32"><img src="${result[i].img1}" alt=""></a>
      <a href="http://127.0.0.1:5500/details.html?lid=32"><img src="${result[i].img2}" alt=""></a>
      <a href="http://127.0.0.1:5500/details.html?lid=34"><img src="${result[i].img3}" alt=""></a>
  </div>
</div>`
  }
  
$(".supper .div2").html(html)
})

//   $.ajax({
//     url:"http://127.0.0.1:3000/index/goods",
//     type:"get",
//     dataType:"json"
//   }).then(result=>{
//     var html="";
//     console.log(result)
// for(var item of result){
//   html+=`<div class="main_one">
//   <div class="huang">
//       <h2 class="hn1">品质进口</h2>
//       <span>/给你完美生活</span>
//   </div>
//   <div>
//       <h4>进口食品 热销榜</h4>
//       <span class="my_small">爆款热卖 实时更新</span>
//   </div>
// </div>
// <-- 中 -->
// <!--<div class="main_tow">
//   <div class="tow_left img_t">
//       <ul>
//           <li><a href="#">进口饼干</a></li>
//           <li><a href="#">进水口</a></li>
//           <li><a href="#">葡萄酒</a></li>
//       </ul>
//       <ul>
//           <li><a href="#">进口牛奶</a></li>
//           <li><a href="#">进口糖巧</a></li>
//           <li><a href="#">进口油</a></li>
//       </ul>
//   </div>
//   <div class="tow_middle my_small">
//       <ul>
//           <li class="middle_one center">
//               <p>进口休闲零食</p>
//               <span class="huang">每满199减100</span>
//               <a href="#" class="huang">点击进入</a>   
//           </li>
//           <li>
//               <img src="image/1.png" alt=""  class="middle_tow">
//           </li>
//           <li>
//               <p class="mar_top">进口饼干</p>
//               <span>每满199减100</span>
//               <img src="image/3.png" alt="" class="middle_three">
//           </li>
//           <li>
//               <p class="mar_top">进口饼干</p>
//               <span>每满199减100</span>
//               <img src="image/3.png" alt="" class="middle_three">
//           </li>
//           <li>
//               <p class="mar_top">进口饼干</p>
//               <span>每满199减100</span>
//               <img src="image/3.png" alt="" class="middle_three">
//           </li>
//           <li>
//               <p class="mar_top">进口饼干</p>
//               <span>每满199减100</span>
//               <img src="image/3.png" alt="" class="middle_three">
//           </li>
//           <li>
//               <img src="image/1.png" alt=""  class="middle_tow mar_l">
//           </li>
//           <li class="middle_one center">
//               <p>进口休闲零食</p>
//               <span class="huang">每满199减100</span>
//               <a href="#" class="huang">点击进入</a>   
//           </li>
//       </ul>
//   </div>
//   <div class="tow_right">
//       <p><img src="image/1.png" alt="" ></p>
//       <p><img src="image/1.png" alt="" ></p>
//       <p><img src="image/1.png" alt="" ></p>
//   </div>
// </div>`
// }
// $(".main").html(html)
//   })
})