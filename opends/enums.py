from enum import Enum


class PythonValueTypes(Enum):
    INT = "int"
    FLOAT = "float"
    STRING = "string"


class AllowBlank(Enum):
    YES = "YES"
    NO = "NO"


class FileNames(Enum):
    REINSSCOPE = "ReinsScope"
    ACC = "Acc"
    LOC = "Loc"
    REINSINFO = "ReinsInfo"


class Required(Enum):
    O = "O"
    CR = "CR"
    R = "R"
