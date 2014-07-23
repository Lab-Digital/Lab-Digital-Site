{extends file='admin.tpl'}
{block name='title' append} - Остальное{/block}
{block name='links' append}
{/block}
{block name='main'}
   <h1>Остальное</h1>
   <h2>Мета-данные для главной страницы</h2>
   {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
   <form method="post" action="/admin/other">
      <div class="form_block">
         <label for="title">Meta title</label>
         <input name="title" id="title" value="{$meta.index_meta_title|default:''}" />
      </div>
      <div class="form_block">
         <label for="description">Meta description</label>
         <textarea name="description" id="description" cols="90" rows="10">{$meta.index_meta_description|default:''}</textarea>
      </div>
      <div class="form_block">
         <label for="keywords">Meta keywords</label>
         <textarea name="keywords" id="keywords" cols="90" rows="10">{$meta.index_meta_keywords|default:''}</textarea>
      </div>
      <div class="buttons"><button id="save" name="mode" value="Update">Сохранить</button></div>
   </form>
{/block}