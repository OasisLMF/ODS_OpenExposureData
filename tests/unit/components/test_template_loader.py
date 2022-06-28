import os
from unittest import main, TestCase

from opends.components.template_loader import TemplateLoader


class TestTemplateLoader(TestCase):

    DIR_PATH = str(os.path.dirname(os.path.realpath(__file__))) + "/meta_data/oed_schema.json"

    def test___init__(self):
        test = TemplateLoader(file_path=self.DIR_PATH)

        self.assertEqual(4, len(test.files))
        self.assertEqual(448, len(test.data.keys()))
        self.assertEqual(['ReinsScope', 'Acc', 'Loc', 'ReinsInfo'], list(test.files.keys()))

    def test_file_inspection(self):
        test = TemplateLoader(file_path=self.DIR_PATH)
        file_one = test.files["ReinsScope"]
        file_two = test.files["Acc"]
        file_three = test.files["Loc"]
        file_four = test.files["ReinsInfo"]
        print("arghyeah")


if __name__ == "__main__":
    main()
