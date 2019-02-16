const express=require("express");
const pool=require("../pool");
const router=express.Router();
router.post("/login",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    console.log(uname);
    console.log(upwd);
    var sql="select count(uid) as c,uid from sp_user where uname=? and upwd=?";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        var c=result[0].c;
        var uid=result[0].uid;
        if(c==1){
          {res.send({code:1,msg:"登录成功",data:[result[0].uid]})
          }
        }else{
          res.send({code:-1,msg:"登录失败"})
        }
      })   
})
router.get("/logout",(req,res)=>{
  req.uid = null;
  console.log(req.uid)
  res.send({code:1,msg:"退出成功"});
})

module.exports=router