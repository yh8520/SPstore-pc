//获取验证码
$(function(){
    $("#switch1").click(function(){
        $value=$(this).val("5秒之后获取验证码");
        $time=$value.val().slice(0,1)
        function $task(){
            $time=parseInt($time)
            $time--;
            if($time>=0)
                {
                    $value.val($time+"秒之后获取验证码");
                }
            else
            {
            var arr="0123456789abcdefghijkmnopqrstuvwsyzABCDEFGHIJKLMNOPQRSTUVWSYZ";
                var newarr=arr.split("");
                var str="";
                for(var i=0;i<4;i++){
                    var j=Math.floor(Math.random()*61);
                    str+=newarr[j]; 
                    $value.val(str);        
                }
                clearInterval($n) ;
                yan()     
            }
        }
        var $n=setInterval($task,1000);
    })
})
//判断验证码是否一致
function yan(){
    $("#switch").blur(function(){
        var $html=$("#switch1").val();
        var $swit=$(this).val();
        var $span=$(this).next().next()
        if(!$swit){
            {$span.html(`<img src='img/err.png'><b style="font-size:12px">验证码不能为空</b>`)}
        }else if($swit.toLowerCase()===$html.toLowerCase()){
            $span.html("<img src='img/ok.png'>")
        }else{
            $span.html(`<img src='img/err.png'><b style="font-size:12px">验证码输入错误</b>`)
        } 
    })
}
// 用户名验证
$("#uname").blur(function(){
    vail($(this),3,12,"用户名必须介于3~12位之间")
})
function vail($this,minlen,maxlen,txt){
    var value=$this.val();
    var $span=$this.next();
    if(value.length>=minlen&&value.length<=maxlen)
        {Name($this)}
    else
        {$span.html(`<img src='img/err.png'><b style="font-size:12px">${txt}</b>`);}
}


//判断密码是否一致
$("#pwd").blur(function(){
    var $upwd=$("#upwd").val();
    var $pwd=$(this).val()
    var $span=$("#pwd").next()
    if(!$pwd){
        $span.html(`<img src='img/err.png'><b style="font-size:12px">请输入正确的密码</b>`);
    }else if($upwd==$pwd){
        $span.html(`<img src='img/ok.png'><b style="font-size:12px">输入密码正确`)
    }
    else{
    $span.html(`<img src='img/err.png'><b style="font-size:12px">两次密码不一致</b>`)
}
})

function sel(Kuan,result,msg){
    var $span=Kuan.next();
    if(result==1){
        $span.html(`<img src='img/ok.png'><b style="font-size:12px">${msg}</b>`);return
    }else{
        $span.html(`<img src='img/err.png'><b style="font-size:12px">${msg}</b>`);return
    }
}  

     //手机号验证
 $("#phone").blur(function(){
    var ze=/1[3~8]\d{9}/
    var  $span=$(this).next();
    var  value=$(this).val();
    var bool=ze.test(value)
    if(bool){
        $span.html(`<img src='img/ok.png'><b style="font-size:12px">手机号码格式正确`)
    }else{
        $span.html(`<img src='img/err.png'><b style="font-size:12px">请输入正确的手机号码格式</b>`)
    }
})
// 密码验证
$("#upwd").blur(function(){
    var value=$(this).val();
    var $span=$(this).next();
    if(value.length>=6&&value.length<=15)
    {$span.html(`<img src='img/ok.png'><b style="font-size:12px">密码格式正确</b>`);}
    else
        {$span.html(`<img src='img/err.png'><b style="font-size:12px">密码必须介于6~15位之间</b>`);}
})

    function Name(userName){
        userName.blur(function(){
            var name=$(this).val();
            $.ajax({
            url:"http://127.0.0.1:3000/register/sel",
            type:"post",
            data:{uname:name},
            dataType:"json"
          }).then(result=>{ 
                sel(userName,result.code,result.msg)
        })
    })
}
    $(":submit").click(function(){
        var name=$("#uname").val();
        var pwd=$("#upwd").val();
        var phone=$("#phone").val();
    $.ajax({
        url:"http://127.0.0.1:3000/register/register",
        type:"post",
        data:{uname:name,upwd:pwd,phone:phone,},
        dataType:"json"
      }).then(result=>{
        console.log(result)
        if(result.code==1){
                alert(result.msg);
                // window.location.href="http://127.0.0.1:5500/login.html";
            }else{
                alert(result.msg)
            }
        }
    )}
)