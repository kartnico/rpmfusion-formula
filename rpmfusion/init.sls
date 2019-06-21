# Completely ignore non-RHEL based systems
{% if grains['os_family'] == 'RedHat' %}

{% from "rpmfusion/map.jinja" import rpmfusion with context %}

rpmfusion_free_release:
  pkg.installed:
    - sources:
      - rpmfusion-free-release: {{ rpmfusion.freerpm }}

{% if rpmfusion.testing %}
enable_rpmfusion_free_testing:
  file.replace:
    - name: /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
    - pattern: '^\s*enabled=[0,1]'
    - count: 1
    - repl: 'enabled=1'
{% else %}
disable_rpmfusion_free_testing:
  file.replace:
    - name: /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
    - pattern: '^\s*enabled=[0,1]'
    - count: 1
    - repl: 'enabled=0'
{% endif %}

{% if rpmfusion.nonfree %}

rpmfusion_nonfree_release:
  pkg.installed:
    - sources:
      - rpmfusion-nonfree-release: {{ rpmfusion.nonfreerpm }}

{% if rpmfusion.testing %}
enable_rpmfusion_nonfree_testing:
  file.replace:
    - name: /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
    - pattern: '^\s*enabled=[0,1]'
    - count: 1
    - repl: 'enabled=1'
{% else %}
disable_rpmfusion_nonfree_testing:
  file.replace:
    - name: /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
    - pattern: '^\s*enabled=[0,1]'
    - count: 1
    - repl: 'enabled=0'
{% endif %}

{% endif %}
{% endif %}
