from pathlib import Path

def get_repo_dir() -> Path:
    '''
    repo dir is parent repo dir
    '''

    return Path(__file__).parents[1]
