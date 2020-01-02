jQuery(function($) {
    // 执行链接前确认
    $("a.link-confirm").on("click", function(e){
        e.preventDefault();
        var $link = $(this);
        myConfirm({
            msg : $(this).attr("data-confirm-msg"),
            confirm:function(){
                location.href = $link.attr("href");
            }
        });
        return false;
    });

    // 修复下拉控件被遮盖bug
    //fixDropdown();

    //头部集成drop_menu是否有下拉菜单
    //$('.head_jicheng_drop_down_menu').each(function(){
    //    var objs = $(this).find('li');
    //    if(objs.length <= 0){
    //        $(this).remove();
    //    }
    //});
});

// 全选复选框
function checkAll(all, item){
    $(all).on("change", function(){
        var isChecked = this.checked;
        //console.log(isChecked);
        $(item).each(function(){
            //console.log($(this)[0]);
            if(isChecked){
                $(this)[0].checked = true;
            }else{
                $(this)[0].checked = false;
            }
        });
    });

    $(item).on("change", function(){
        var allChecked = true;
        $(item).each(function(){
            //console.log($(this)[0]);
            if(!$(this)[0].checked){
                allChecked = false;
                return false;
            }
        });
        if(allChecked){
            $(all)[0].checked = true;
        }else{
            $(all)[0].checked = false;
        }
    });
}

// 警告框
function myAlert(msg, ok, options) {
    $('.am-modal').modal('close')
    $('<div class="am-modal am-modal-alert" tabindex="-1">'+
        '<div class="am-modal-dialog">'+
        '<div class="am-modal-bd">' + msg + '</div>'+
        '<div class="am-modal-footer">'+
        '<span class="am-modal-btn">'+ (ok || '确定') +'</span>'+
        '</div>'+
        '</div>'+
        '</div>').appendTo("body").modal(options);
}

// 确认框
function myConfirm(options) {
    $('<div class="am-modal am-modal-confirm" tabindex="-1">'+
        '<div class="am-modal-dialog">'+
        '<div class="am-modal-bd">' + options.msg + '</div>'+
        '<div class="am-modal-footer">'+
        '<span class="am-modal-btn" data-am-modal-cancel>'+ (options.no || '取消') +'</span>'+
        '<span class="am-modal-btn" data-am-modal-confirm>'+ (options.yes || '确定') +'</span>'+
        '</div>'+
        '</div>'+
        '</div>').appendTo("body").modal({
        relatedTarget: options.target,
        onConfirm: options.confirm,
        onCancel: options.cancel
    });
}

/**
 *
 * @param options
 *
 *  var options={
 *   title:"标题",
 *   target:this,
 *   footer:false,
 *   confirm: function (e) {
 *       console.log("确认");
 *   },
 *   cancel:function (e) {
 *       console.log("取消");
 *   }
 * }
 myDialog(options)
 */
function myDialog(options) {
    $("#myDialog").remove();
    $('<div class="am-popup" id="myDialog" style="z-index: 99999">' +
        '<div class="am-popup-inner">' +
        '<div class="am-popup-hd">' +
        '<h4 class="am-popup-title">'+(options.title || "提示")+'</h4>' +
        '<span data-am-modal-close class="am-close">&times;</span>' +
        '</div>' +
        '<div class="am-popup-bd" style='+(options.footer?"height:92%":"height:100%")+'>' +options.body+
        ' </div>' +
        (options.footer?
            '<div class="am-modal-footer">' +
            '<span class="am-modal-btn" data-am-modal-cancel>' + (options.no || '取消') + '</span>' +
            '<span class="am-modal-btn" data-am-modal-confirm>' + (options.yes || '确认') + '</span>' +
            '</div>' +
            '</div>' +
            '</div>':"")).appendTo("body").modal({
        relatedTarget: options.target,
        onConfirm: options.confirm,
        onCancel: options.cancel
    }).on('closed.modal.amui', function(){
        console.log('第一个演示弹窗关闭了');
    }).on('open.modal.amui.find', options.init).find('[data-am-modal-confirm]').off('click.close.modal.amui');

}
