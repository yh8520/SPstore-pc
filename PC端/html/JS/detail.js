// var tabs=document.querySelectorAll("[data-toggle=tab]")
// console.log(tabs)




// //
// var cala=document.querySelector("#cala>li>.li_ul")
// console.log(cala)
// var btn=document.querySelectorAll(".li_ul>li>button")
// console.log(btn)
// for(var btns of btn){
//   btns.onclick=function(){
//     var span=this.parentNode.parentNode.children[0].children[0]
//     var n=parseInt(span.innerHTML)
//     if(this.innerHTML=="+")
//       n++;
//     else if(n>0)
//       n--;
//     span.innerHTML=n
//   }
// }

// //
// $("img.data").mouseover(function(){
//   var src=$(this).attr("data-target")
//   $(".b_bd>.big").attr({src})//标准html属性，可将attr换成prop
// })
function times(){
  var end=new Date("2019/2/2 18:00:00");
  var now=new Date();
  var s=parseInt((end-now)/1000);
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
    $(".tow>div>div>#time").html(`倒计时：<b style="color:red">${h}:${m}:${s}</b>`)
  }
}
setInterval(times,1000);

var lid=window.location.search.split("=")[1];
sessionStorage.setItem('lid',lid);
$.ajax({
  url:"http://127.0.0.1:3000/details/details?lid="+lid,
  type:"get",
  dataType:"json"
}).then(data=>{
  var pic=data.pics;
  var pro=data.product;
  var spec=data.specs;
  console.log(data)

  html=`
  <span class="bold">${pro.title}</span>
</div>
  <div>
  <a href="#" class="my_small"><img src="img/good.png" alt="">好评率<span class="red">97%</span>[评论<span class="red">34万+</span>条]</a></div>
`
$(".one").html(html)

  var html=`
          <div class="three_o my_middle">
                  <div class="ty_w">优惠券</div>
                  <div class="tt"></div>
                  <div class="ts"><a href="#" class="black">领取优惠券</a></div>
              </div>
              <div class="three_o my_middle">
                    <div class="ty_w">促销</div>
                    <div class="tt"></div>
                    <div class="ts"><a href="#" class="black" >共1项,展开查看</a></div>
              </div>`;
    $(".three").html(html);


var html=""
 for(var item of spec){
  console.log(item.lid)
   html+=`<a href="details.html?lid=${item.lid}" class="black ${item.lid==lid?'bd_red':''}">
            <img src="img/2.jpg" alt="">
            <span class="my_middle">${item.spec}</span>
          </a>`
 }
 $(".f_right").html(html)

var html="";
for(var item of pic){

    html+=`
          <img src="${item.sm}" class="data" data-md="${item.md}">
          `}
  $(".left_b").html(html)  
    $(".b_bd>img").attr("src",`${pic[0].md}`);
    console.log($(".b_bd>img").attr("src"))
    $(".left_b>img").mouseover(function(){
       var $img=$(this);
        $(".b_bd>img").attr("src",$img.attr(`data-md`))
    })

 var html="";
   html+=`<select>
   <option value="">上海静安区城区</option>
</select>
<span >有货，23:00前下单,预计明天(12月10日)送达</span>
<p>由 XXX 发货,并提供售后服务 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<span class="my_blue">支持&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;满86元免基础生鲜商品运费(50kg内)     准时达&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;211限时达</span></p>
<ul id="cala">
   <li>
       <ul class="li_ul">
           <li><span class="span">1</span></li>
           <li><button class="btn1 btn_t">+</button></li>
           <li><button class="btn2 btn_t">-</button></li>
       </ul>
   </li>
   <li><button class="but3">加入购物车</button></li>
   <li class="my_small my_blue my_top">降价通知</li>
</ul>`
 $(".five>.my_small").html(html)
})

// // 请求图片
// $.ajax({
//   url:"http://127.0.0.1:3000/details/pic?lid="+f_id,
//   type:"get",
//   dataType:"json"
// }).then(data=>{
//  
// })