rpmfusion
====

Install the RPMFUSION RPM on RHEL 6/7/8, CentOS 6/7/8 and Fedora 29/30/31/32.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``rpmfusion``
--------

Installs RPMFUSION RPM package for the current OS.

The RPMFUSION nonfree repository can be enabled by setting the Pillar ``rpmfusion:nonfree: True``.
