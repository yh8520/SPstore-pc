$(function(){
function loadPage(pno=0){
    var keyword=decodeURI(
        location.search.split("=")[1]);
            $.ajax({
            url:`http://127.0.0.1:3000/header/keyword?keyword=${keyword}`,
            type:"get",
            dataType:"json"
          }).then(result=>{
            var  pno=result.pno;
            var  pageCount=result.pageCount;
            console.log(result)
            var html=""
           for(var item of result.products){
            html+=`<li>
            <div>
                <a href=""><img src="${item.md}"></a>
                <p class="red bold">￥${item.price}</p>
                <p class="ccc"><a href="#" class="aaa black my_middle ">${item.title}
                </a></p>
               <div class="cart"> 
                    <div class="btn">
                        <button>-</button>
                        <span>1</span>
                        <button>+</button>
                    </div>
                    <div class="agwc">
                        <a href="javascript:;" class="white">加入购物车</a>
                    </div>
                </div>
            </div>
        </li>`
           }
           $(".list-main>div>ul").html(html)
           var $firstLi=$(".page>div>a:first");
           if(pno==0)
             $firstLi.addClass("disabled");
           var $lastLi=$(".page>div>a:last");
           if(pno==pageCount-1)
             $lastLi.addClass("disabled")
       })
    }  
       loadPage()
     $(".page>div")
     .on("click","a",function(e){
       e.preventDefault();
       var pno;
       if($(this).html()=="上一页"){
         var i=parseInt(
           $(".page>div>a").html()
         );
         pno=i-2;
       }else if($(this).html()=="下一页"){
         var i=parseInt(
           $(".page>div>a").html()
         );
         pno=i;
       }else
         pno=$(this).html()-1;
        loadPage(pno);  
     })
      
})
