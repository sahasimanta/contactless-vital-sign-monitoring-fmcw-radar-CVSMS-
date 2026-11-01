import numpy as np
from src.demo import estimate_rate

def test_rate():
    fs = 20
    t = np.arange(0, 120, 1/fs)
    rate, _ = estimate_rate(np.sin(2*np.pi*1.2*t), fs, .8, 2.2)
    assert abs(rate - 72) < 1
