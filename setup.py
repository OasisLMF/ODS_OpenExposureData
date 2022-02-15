import io
import os
import re
import setuptools


SCRIPT_DIR = os.path.abspath(os.path.dirname(__file__))


def get_readme():
    try: 
        with io.open(os.path.join(SCRIPT_DIR, 'src', 'README.md'), encoding='utf-8') as readme:
            return readme.read()
    except FileNotFoundError:
        with io.open(os.path.join(SCRIPT_DIR, 'README.md'), encoding='utf-8') as readme:
            return readme.read()


def get_version():
    """
    Return package version as listed in `__version__` in `init.py`.
    """
    with io.open(os.path.join(SCRIPT_DIR, 'src', '__init__.py'), encoding='utf-8') as init_py:
        return re.search('__version__ = [\'"]([^\'"]+)[\'"]', init_py.read()).group(1)


version = get_version()
readme = get_readme()

setuptools.setup(
    name="ods_tools",
    version=version,
    include_package_data=True,
    package_data={"": ["*.csv", "*.md"]},
    entry_points={
        'console_scripts': [
            'ods_tools=ods_tools:main',
        ]
    },
    author='Oasis LMF',
    author_email="support@oasislmf.org",
    packages=['ods_tools'],
    package_dir={'ods_tools': 'src'},
    python_requires='>=3.7',
    description='Tools to manage ODS files',
    long_description=readme,
    long_description_content_type='text/markdown',
    url='https://github.com/OasisLMF/OpenDataStandards',
)
