.. _box_space-vcollation:

===============================================================================
box.space._vcollation
===============================================================================

.. module:: box.space

.. data:: _vcollation

    ``_vcollation`` is a system space with a list of :ref:`collations <index-collation>`.
    The structure
    of its tuples is identical to that of
    :doc:`/reference/reference_lua/box_space/_collation`, but
    permissions for certain tuples are limited in accordance with user privileges.
