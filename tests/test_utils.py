import unittest
from pathlib import Path

from example_package import utils

class TestUtils(unittest.TestCase):
    def test_get_repo_dir(self) -> None:
        returned_dir = utils.get_repo_dir()
        repo_dir = Path(__file__).parent.parent

        self.assertTrue(repo_dir.is_dir())
        self.assertEqual(repo_dir, returned_dir)
        self.assertEqual(repo_dir.name, 'conda_env_demo')

        return
