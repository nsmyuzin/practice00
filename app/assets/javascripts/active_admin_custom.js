$(function(){
    $(function(){
        var side_item_select_array = $('select').filter(function(i, e) {
            return e.id && e.id.match(/^article_side_items_attributes_\d*_(item_type|place)$/);
        });
        side_item_select_array.change(function(){
            var array = $(this).attr('id').match(/^article_side_items_attributes_(\d*)_([\w]*)$/);
            var order = array[1]; var touch_column = array[2];
            var parameters = {};
            var columns = ['item_type','item_id','place','template'];
            test =$(this).closest('fieldset').serializeArray(); //eachの代替案。あるべき姿。楽
            $.each(columns, function(index, name){ //各カラム値をparametersに挿入
                var col = 'parameters.' + name;
                var value = "$('#article_side_items_attributes_' + order + '_' + name + ' option:selected').val()";
                eval(col + ' = ' + value );
            });
            // ajax
            $.ajax({
                type: 'POST',
                url: '/admin/side_items/ajax_model_and_tmp',
                data: {
                    select_column: touch_column,
                    side_items: parameters
                },
                dataType: 'json'  //json形式指定
            }).done(function (data) {
                $.each(data['item_id'], function(key,value){
                    if (key == 0){ $(`#article_side_items_attributes_${order}_item_id`).children().remove(); };
                    $(`#article_side_items_attributes_${order}_item_id`).append($('<option>').html(value[0]).val(value[1]));
                });
                $.each(data['template'], function(key,value){
                    if (key == 0){ $(`#article_side_items_attributes_${order}_template`).children().remove(); };
                    $(`#article_side_items_attributes_${order}_template`).append($('<option>').html(value[0]).val(value[1]));
                });
            });
        });
    });
    $(function() {
        var number = $('.side_items_field').length; var num= number +1;
        $('.add_item_button').on('click', function() {
            var input =
                '<ol>'
                + '<label>'+ num +'番目</label>'
                + '<li class="select input required" id="article_side_items_attributes_'+ number +'_item_type_input"><label for="article_side_items_attributes_'+ number +'_item_type" class="label">モデルタイプ<abbr title="必須">*</abbr></label><select name="article[side_items_attributes]['+ number +'][item_type]" id="article_side_items_attributes_'+ number +'_item_type"><option value=""></option>'
                + '<option value="1">Article</option>'
                + '<option value="2">ArticlePickup</option>'
                + '<option value="3">Banner</option>'
                + '<option value="4">Category</option></select>'
                + '</li>'
                + '<li class="select input optional" id="article_side_items_attributes_'+ number +'_item_id_input"><label for="article_side_items_attributes_'+ number +'_item_id" class="label">モデルID</label><select name="article[side_items_attributes]['+ number +'][item_id]" id="article_side_items_attributes_'+ number +'_item_id"><option value=""></option></select>'
                + '</li>'
                + '<li class="select input required" id="article_side_items_attributes_'+ number +'_place_input"><label for="article_side_items_attributes_'+ number +'_place" class="label">配置場所<abbr title="必須">*</abbr></label><select name="article[side_items_attributes]['+ number +'][place]" id="article_side_items_attributes_'+ number +'_place"><option value=""></option>'
                + '<option value="1">LEFT</option>'
                + '<option value="2">RIGHT</option></select>'
                + '</li>'
                + '<li class="select input required" id="article_side_items_attributes_'+ number +'_template_input"><label for="article_side_items_attributes_'+ number +'_template" class="label">テンプレート<abbr title="必須">*</abbr></label><select name="article[side_items_attributes]['+ number +'][template]" id="article_side_items_attributes_'+ number +'_template"><option value=""></option></select>'
                + '</li>'
                + '<li class="hidden input required" id="article_side_items_attributes_'+ number +'_order_input"><input id="article_side_items_attributes_'+ number +'_order" type="hidden" name="article[side_items_attributes]['+ number +'][order]">'
                + '</li>'
                + '<li class="boolean input optional" id="article_side_items_attributes_'+ number +'__destroy_input"><input type="hidden" name="article[side_items_attributes]['+ number +'][_destroy]" value="0"><label for="article_side_items_attributes_'+ number +'__destroy" class=""><input type="checkbox" name="article[side_items_attributes]['+ number +'][_destroy]" id="article_side_items_attributes_'+ number +'__destroy" value="1">Destroy</label>'
                + '</li>'
                + '</ol>'
            $('.side_items_field').append(input);
            number ++;
        });
        $('.inputs side_items_field').on('click', '.member_delete', function() {
            var inputId = $(this).data('id');
            var defaultData = $(this).data('default');
            if (defaultData == 'default') {
                $(this).prev().prop('checked', true);
                $('#add_member_' + inputId).hide();
            }else{
                $('#add_member_' + inputId).remove();
            }
        });
    });
});
