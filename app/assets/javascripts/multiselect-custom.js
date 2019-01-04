function multi_wide_select(name){
    $(name).multiSelect({ keepOrder: true });
    $('#select-all').click(function(){
        $(name).multiSelect('select_all');
        return false;
    });
    $('#deselect-all').click(function(){
        $(name).multiSelect('deselect_all');
        return false;
    });
    //選択リスト枠のスタイル
    $(".ms-selectable").css({
        width: '540px',
        height: '600px'
    });
    //選択済みリスト枠のスタイル
    $(".ms-selection").css({
        width: '540px',
        height: '600px'
    });
    //リスト内のスタイル
    $(".ms-list").css("height","600px");
    //multi-select全体のスタイル
    $(".ms-container").css({
        width: '1380px',
        height: '600px'
    });
    return false;
};
