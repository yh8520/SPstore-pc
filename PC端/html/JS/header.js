$(function(){
  $.ajax({
    url:"http://127.0.0.1:5500/header.html",
    type:"get",
    success:function(res){
      // 动态加载样式
      $("<link rel='stylesheet' href='css/header.css'>").appendTo("head");
      $("<link rel='stylesheet' href='css/index.css'>").appendTo("head");
      $(res).replaceAll("#header");
      // 弹出菜单
      tan(".tan_hover",".nav_a>a");
      function tan(hover,hover_a){
        $(hover).hide()
        $(hover_a).parent().mouseover(function(){$(hover).show()})
        .mouseout(function(){
        $(hover).hide();
        })
      }
      // 跨页面接收参数
      var num=sessionStorage.getItem("id")
      var n= sessionStorage.getItem("name");
      var uid=sessionStorage.getItem("uid");
      if(num==1){
        $("#login").html(n);
         // 用户退出登录
        $(".wei>a:first-child").click(function(e){
          e.preventDefault();
          $.ajax({
            url:"http://127.0.0.1:3000/logout="+uid,
            type:"get",
            dataType:"json"
          }).then(result=>{
            console.log(result)
          })
        })
      }
      // 时间格式替换文本
      var now=new Date()
      console.log(now);
      if(now>1 || now<10){
        $(".dw>span").html("早上好")
      }else if(now>=11 || now<12){
        $(".dw>span").html("中午好")
      }else if(now>13 || now<16){
        $(".dw>span").html("下午好")
      }else if(now>17 || now<23){
        $(".dw>span").html("晚上好")
      }
      var N=$("#login").html()
      if(N==n){
        tan(".wei","#login");
        $(".dw>span").html("欢迎回来")
      }      
      var html=location.search.split("=")[1];
      console.log(html)
      var $ulF=$(".tan1 ul")
      console.log($ulF)
      $ulF.click(function(e){
        if(e.target.nodeName=="A"){
          var $a=e.target;
           var zhi=$a.innerHTML
           location.href="list.html?keyword="+zhi
        }
      })
      
      
      // 动态添加数据到数据库中(input框)
    //   $(".search").click(function(e){ 
    //     var name=$(".bottom_right>input").val();
    //     console.log(name)
    //     e.preventDefault();
    //     $.ajax({
    //     url:"http://127.0.0.1:3000/header/sales1?name="+name,
    //     type:"get",
    //     dataType:"json"
    //   }).then(result=>{
    //    console.log(result);
    //  })
    //  })

    var $input=$(".bottom_right>input");
    var $btnSearch=$(".search");
    $btnSearch.click(function(){
      if($input.val().trim().length>0)
        location.href="list.html?keyword="+$input.val()
    });
    $input.keyup(function(e){
      if(e.keyCode==13){
        $btnSearch.click();
      }
    })
    if(location.search.indexOf("keyword")!=-1){
      $input.val(
        decodeURI(
          location.search.split("=")[1]
        )
      );
    }
  }
  })


  // input框替换
      $.ajax({
        url:"http://127.0.0.1:3000/header/sales",
        type:"get",
        dataType:"json"
      }).then(result=>{
          var i=-1
        function val(){
            i++;
            if(i==4){
              i=0;      
            }
            $(".bottom_right>input").attr("placeholder",result[i].name)
            $(".bottom_right>input").focus(function(){
              clearInterval(n)
            })
            $(".bottom_right>input").blur(function(){
              n=setInterval(val,3000) 
            })
          }
          var n=setInterval(val,3000)  
      })
  
})