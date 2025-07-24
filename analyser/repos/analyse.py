# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: -all
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.17.2
#   kernelspec:
#     display_name: di-python-data-analyse (3.12.7)
#     language: python
#     name: python3
# ---

# %%
from utils import hent_data

df = hent_data()
print(df.head())

# %%
