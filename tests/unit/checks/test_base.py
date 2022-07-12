from unittest import main, TestCase

import pandas as pd

from opends.checks.base import Check
from opends.components.template_loader import TemplateLoader
from tests.unit.utils import DIR_PATH


class TestCheck(TestCase):

    def setUp(self) -> None:
        self.templates = TemplateLoader(file_path=DIR_PATH)
        self.loc_file = self.templates.get_or_insert(file_name="Loc")
        self.reinsinfo_file = self.templates.get_or_insert(file_name="ReinsInfo")
        self.acc_file = self.templates.get_or_insert(file_name="Acc")
        self.data = pd.DataFrame([{"one": 1, "two": 2}, {"one": 1, "two": 2}])
        self.test = Check(data=self.data, file=self.loc_file, check_name="test base check")

    def tearDown(self) -> None:
        pass

    def test___init__(self):
        self.assertEqual(self.loc_file, self.test.file)
        self.assertEqual("test base check", self.test.check_name)
        self.assertEqual([], self.test.log_data)
        self.assertEqual(False, self.test.passed)

    def test_run(self):
        with self.assertRaises(NotImplementedError) as error:
            self.test.run()
        self.assertEqual("run function needs to be implemented for the test base check", str(error.exception))

    def test_check_if_flexi_field_name(self):
        outcome = self.test.check_if_flexi_field_name(name="PortNumber")

        self.assertEqual(False, outcome)

        outcome = self.test.check_if_flexi_field_name(name="flexilocPortNumber")

        self.assertEqual(True, outcome)

    def test_flexi_prefix(self):
        self.assertEqual("flexiloc", self.test.flexi_prefix)


if __name__ == "__main__":
    main()
