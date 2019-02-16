$(":submit").click(function(){
    var uname=$(".yin").val();
    var upwd=$(".yin1").val();
    $.ajax({
        url:"http://127.0.0.1:3000/login/login?uname="+uname+"&upwd="+upwd,
        type:"post",
        dataType:"json"
      }).then(data=>{
        var uid=data.data[0]
          if(data.code==1){
            sessionStorage.setItem("name",uname);
            sessionStorage.setItem("id",data.code)
            sessionStorage.setItem("uid",uid)
            setTimeout(function(){
            window.location.href="http://127.0.0.1:5500/index.html";},2000)
          }else{
            // 重新刷新
            // history.go(0)
            location.reload()
          }
      })
})
// $(":submit").click(function(){
//     var uname=$(".yin").val();
//     var upwd=$(".yin1").val()
//     $.ajax({
//         url:"http://127.0.0.1:3000/login/login1?uname="+uname+"&upwd="+upwd,
//         type:"post",
//         dataType:"json"
//       }).then(data=>{
//           console.log(data)
//         //   if(data.code==1){
//         //       Response.redirect=("http://127.0.0.1:5500/index.html")
//         //   }
//       })
// }) 
