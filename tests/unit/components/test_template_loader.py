"""
This file tests the class around loading the raw data standards JSON data.
"""
from unittest import main, TestCase

from opends.components.template_loader import TemplateLoader, File, TemplateLoaderSingleton
from tests.unit.utils import DIR_PATH


class TestTemplateLoader(TestCase):

    def setUp(self) -> None:
        TemplateLoaderSingleton._instances = {}

    def test___init__(self):
        test = TemplateLoader(file_path=DIR_PATH)

        self.assertEqual(4, len(test.files))
        self.assertEqual(460, len(test.data.keys()))
        self.assertEqual(['ReinsScope', 'Acc', 'Loc', 'ReinsInfo'].sort(), list(test.files.keys()).sort())

    def test_file_inspection(self):
        test = TemplateLoader(file_path=DIR_PATH)

        self.assertEqual(File("ReinsScope"), test.files["ReinsScope"])
        self.assertEqual(File("Acc"), test.files["Acc"])
        self.assertEqual(File("Loc"), test.files["Loc"])
        self.assertEqual(File("ReinsInfo"), test.files["ReinsInfo"])


if __name__ == "__main__":
    main()
