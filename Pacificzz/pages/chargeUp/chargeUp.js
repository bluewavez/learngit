// pages/chargeUp/chargeUp.js
import { String } from '../../utils/util.js';
import '../../utils/util.js';
var money;
var describ;
var chargeList;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    date:"点击选择日期",
    chargeList:[{
      date:'11',
      price:'1',
      describ:'2'
    },]
  },

  bindDateChange: function (e) {
    this.setData({
      date: e.detail.value
    })
  },

  money:function(e){
    money=e.detail.value
  },

  describ:function(e){
    describ=e.detail.value
  },
  
  showTopTips:function(){
    var that = this;
    if (String.isBlank(that.data.date) || that.data.date == '点击选择日期') {
      wx.showToast({
        title: '请选择日期',
      })
    }
    else if(String.isBlank(money)){
      wx.showToast({
        title: '请输入金额',
      })
    }
    else if (String.isBlank(describ)){
      wx.showToast({
        title: '请输入描述',
      })
    } 
    else{
    var obj = {
      'date':that.data.date,
      'price':money,
      'describ':describ
    };
    that.data.chargeList.push(obj);
    try {
      wx.setStorageSync('chargeList',that.data.chargeList)
    wx.showToast({
      title: '缓存成功',
    })
    wx.navigateBack({
    })
  }
     catch(e) {
    wx.showToast({
      title: e,
    })
  }
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
      that.data.chargeList = JSON.parse(options.chargeList)
      if(!that.data.chargeList){
        that.data.chargeList = new Array
      }
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  //   var form = require('../../utils/util.js')
  // console.log(
  //   form.formatTime(new Date())
  // )
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})