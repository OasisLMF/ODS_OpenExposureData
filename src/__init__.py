__version__ = '2.0.0'
from .oed import *

import logging

logger = logging.getLogger(__name__)
logger.addHandler(logging.NullHandler())


