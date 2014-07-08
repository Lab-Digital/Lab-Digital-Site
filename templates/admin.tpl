{extends file='html.tpl'}
{block name='title' append} - Админ-панель{/block}
{block name='links' append}
  <link href="/css/admin.css" rel="stylesheet" />
  <link href="/css/main.css" rel="stylesheet" />
  <link href="/css/forms.css" rel="stylesheet" />
{/block}
{block name='page'}
<div id="wrap">
  <header>
    <nav>
      <ul>
        <li><a href="/admin/news">Новости</a></li><li><a href="/admin/we">Наша команда</a></li><li><a href="/admin/cases">Кейсы</a></li><li><a href="/admin/services">Услуги</a></li><li><a href="/admin/other">Остальное</a></li>
      </ul>
    </nav>
  </header>
  {block name='main'}
  {/block}
</div>
{/block}