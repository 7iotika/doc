.. _box-is_in_txn:

================================================================================
box.is_in_txn()
================================================================================

.. function:: box.is_in_txn()

    If a transaction is in progress (for example the user has called
    :doc:`/reference/reference_lua/box_txn_management/begin` and has not yet
    called either :doc:`/reference/reference_lua/box_txn_management/commit`
    or :doc:`/reference/reference_lua/box_txn_management/rollback`,
    return ``true``. Otherwise return ``false``.