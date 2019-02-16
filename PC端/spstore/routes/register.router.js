const express=require("express");
const pool=require("../pool");
const router=express.Router()
router.post("/register",(req,res)=>{
  var $uname=req.body.uname;
  var $upwd=req.body.upwd;
  var $phone=req.body.phone;
      var sql ="INSERT INTO sp_user VALUES(null,?,?,null,?,null,null,null)";
      pool.query(sql,[$uname,$upwd,$phone],(err,result)=>{
             if(err)throw err;
             if(result.affectedRows>0){
               res.send({code:1,msg:"注册成功"})
             }else{
               res.send({code:-1,msg:"注册失败"});
             }
       })
    })
router.post("/sel",(req,res)=>{
    var $uname=req.body.uname;
    console.log($uname)
    var sql="select count(uid) c from sp_user where uname=?";
    pool.query(sql,[$uname],(err,result)=>{
      if(err) throw err;
      console.log(result[0].c)
      if(result[0].c>0){
        res.send({code:-1,msg:"用户名已被注册",codeid:0});
      }else{
        res.send({code:1,msg:"用户名可以被注册"})
      }
  })
})
module.exports=router;