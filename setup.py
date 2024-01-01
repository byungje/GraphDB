import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="gsc_st_auth_check",
    version="0.1",
    author="ByungJeBang",
    author_email="byungjebang@mz.co.kr",
    description="ByungJeBang",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="",
    project_urls={},
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    package_dir={"": "src"},
    packages=setuptools.find_packages(where="src"),
    python_requires=">=3.6",
    install_requires=[
        'PyJWT==1.7.1',
        'streamlit-javascript==0.1.5'
    ],
)