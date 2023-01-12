import io
import os
import re
import setuptools


SCRIPT_DIR = os.path.abspath(os.path.dirname(__file__))


def get_readme():
    try:
        with io.open(os.path.join(SCRIPT_DIR, 'ods_tools', 'README.md'), encoding='utf-8') as readme:
            return readme.read()
    except FileNotFoundError:
        with io.open(os.path.join(SCRIPT_DIR, 'README.md'), encoding='utf-8') as readme:
            return readme.read()


def get_version():
    """
    Return package version as listed in `__version__` in `init.py`.
    """
    with io.open(os.path.join(SCRIPT_DIR, 'ods_tools', '__init__.py'), encoding='utf-8') as init_py:
        return re.search('__version__ = [\'"]([^\'"]+)[\'"]', init_py.read()).group(1)


def get_install_requirements():
    with io.open(os.path.join(SCRIPT_DIR, 'requirements.in'), encoding='utf-8') as reqs:
        return reqs.readlines()


version = get_version()
readme = get_readme()
reqs = get_install_requirements()

setuptools.setup(
    name="ods_tools",
    version=version,
    include_package_data=True,
    package_data={
        "": ["*.md"],                # Copy in readme
        "ods_tools": ["data/*"]      # Copy spec JSON/CSV
    },
    entry_points={
        'console_scripts': [
            'ods_tools=ods_tools.main:main',
        ]
    },
    author='Oasis LMF',
    author_email="support@oasislmf.org",
    packages=['ods_tools', 'ods_tools.oed', 'ods_tools.data'],
    package_dir={'ods_tools': 'ods_tools'},
    python_requires='>=3.7',
    install_requires=reqs,
    description='Tools to manage ODS files',
    long_description=readme,
    long_description_content_type='text/markdown',
    url='https://github.com/OasisLMF/OpenDataStandards',
)
