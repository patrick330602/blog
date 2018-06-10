{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ __('title.links') }} | {{ config.title }}{% endblock %}

{% block page_class %}page-links{% endblock %}

{% block content %}
<h1 class="post-title" itemprop="name headline">Friends 朋友</h1>
<div class="post post-meta">You are welcomed to exchange links by leaving a message on this page!</div>
<div>
    {% for link in site.data.links %}
        <div class="links-item">
            <div class="links-avatar">
                <a href="{{ link.link }}" target="_blank">
                	<img src="{{ link.avatar }}" alt="">
                </a>
            </div>
            <div class="links-info">
                <h4><a href="{{ link.link }}" target="_blank"><span>{{ link.name }}</span></a></h4>
                <span>{{ link.desc }}</span>
            </div>
        </div>
    {% endfor %}
</div>
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}