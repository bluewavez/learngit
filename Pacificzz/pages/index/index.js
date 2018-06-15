
var chargeList;
Page({
  data:{
    total:"--",
    today:"--"
  },

  chargeUp:function() {
    var that = this
    wx.navigateTo({
      url: '../chargeUp/chargeUp?chargeList='+JSON.stringify(chargeList),
    })
  },

totalMoney:function(){
  var totalm = 0
  var todaym = 0
  var that = this
  var currentDate = new Date()
  var month = (parseInt(currentDate.getMonth()) + 1)
  month = month > 9 ? month : ("0"+month)
  var day = currentDate.getDate()
  day = day > 9 ? day : ("0" + day)
  var currentDateString = currentDate.getFullYear() + '-' + month+'-'+ day 
  for(var obj in chargeList){
    var pricem = parseFloat(chargeList[obj].price).toFixed(2)
    var pricer = parseFloat(pricem)
    totalm += pricer
    if (currentDateString == chargeList[obj].date){
      todaym += pricer
    } 
  }
  this.setData({
    total: totalm,
    today: todaym
  })
},

  clearCharge:function(){
    var that = this
    wx.showModal({
      title: '警示',
      content: '点击确定删除全部数据',
      confirmText: '确定',
      cancelText: '取消',
      success: function (res) {
        if (res.confirm) {
          wx.clearStorageSync()
          chargeList = ''
          that.totalMoney()
          that.setData({
            chargeList: '',
          })
        } else if (res.cancel) {
          console.log('用户点击次要操作')
        }
      }
    })
  },
  clickItem:function(e){
    var that = this
    wx.showModal({
      title: '警示',
      content: '要删除该条记录吗？',
      confirmText:'删除',
      cancelText:'取消',
      success:function(res){
        if(res.confirm){
          var index = e.target.dataset.index;

          var list = that.data.chargeList;

          //移除列表中下标为index的项

          list.splice(index, 1);
          //更新列表的状态

          that.setData({

            chargeList: list

          });
          chargeList = list
          that.totalMoney()
          wx.setStorageSync('chargeList', list)
          wx.showToast({
            title: '删除成功',
          })
        }
      }
    })
  },

  onLoad: function() {
  },

  onShow:function(){
    var that = this;
    try {
      chargeList = wx.getStorageSync('chargeList')
      that.setData({
        chargeList: chargeList,
      })
    }
    catch (e) {
      wx.showModal({
        title: '提示',
        content: '欢迎使用，开始记账吧',
      })
    }
    that.totalMoney()
  }
})