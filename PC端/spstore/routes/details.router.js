const express=require("express");
const pool=require("../pool");
const router=express.Router();
router.get("/details",(req,res)=>{
    var output={product:{},specs:[],pics:[]};
    var lid=req.query.lid;
    if(pno===undefined) pno=0;
    if(lid!==undefined){
      var sql="select * from sp_pro where lid=?";
      pool.query(sql,[lid],(err,result)=>{
        if(err) console.log(err);
        output.product=result[0];
        var f_id=output.product.f_id;
        var sql="select lid,spec from sp_pro where f_id=?";
        pool.query(sql,[f_id],(err,result)=>{
          if(err) console.log(err);
          output.specs=result;
          var sql="select * from sp_pic where sp_id=?";
          pool.query(sql,[lid],(err,result)=>{
            if(err) console.log(err);
            output.pics=result;
            res.send(output);
          })
        })
      })
    }else{
      output.err="请提供lid"
      res.send(output);
    }
  })
  // router.get("/key",(req,res)=>{
  //   var pno=req.query.pno;
  //   if(pno===undefined) pno=0;
  //   var sql=`select title,subtitle,price ,(select md from sp_pic where sp_id=lid limit 1) as md from sp_pro where f_lid`
module.exports=router;