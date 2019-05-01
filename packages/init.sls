{% for tag in pillar.get('packages', {}) -%}
{%      for pkg in pillar.get('packages:' ~ tag ~ ':install', {}) -%}
{{ pkg }}:
    pkg.installed
{%      endfor %}
{%      for pkg in pillar.get('packages:' ~ tag ~ ':remove', {}) -%}
{{ pkg }}:
    pkg.purged
{%      endfor %}
{% endfor %}