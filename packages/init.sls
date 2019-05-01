{% set packages = salt['pillar.get']('packages', {}) -%}
{% for tag in packages -%}
{%      set install_packages = salt['pillar.get']('packages:' ~ tag ~ ':install', {}) -%}
{%      set remove_packages = salt['pillar.get']('packages:' ~ tag ~ ':remove', {}) -%}
{%      for pkg in install_packages -%}
{{ pkg }}:
    pkg.installed
{%      endfor -%}
{%      for pkg in remove_packages -%}
{{ pkg }}:
    pkg.purged
{%      endfor -%}
{% endfor -%}