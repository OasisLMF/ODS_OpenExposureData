"""
This file defines the OffendingColumns class which holds the names of the columns in checks that have defects. This
enables other checks to reference defected columns in order to avoid them. Right now the OffendingColumns class
implements a Singleton pattern so the state can be referenced by other checks. However, if more data needs to be
passed between tests we will have to come up with a different way of passing data between checks.
"""


class OffendingColumnsSingleton(type):
    """
    This class implements the Singleton pattern.
    """
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super(OffendingColumnsSingleton, cls).__call__(*args, **kwargs)
        return cls._instances[cls]


class OffendingColumns(list, metaclass=OffendingColumnsSingleton):
    """
    This class is responsible for holding names of the columns that have defects in. This class implements the
    Singleton pattern so it can be easily synced with all tests.
    """
    def __init__(self) -> None:
        """
        The constructor for the OffendingColumns class.
        """
        super().__init__([])
