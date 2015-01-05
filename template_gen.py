# coding: utf-8
import jinja2
env = jinja2.Environment()
env.loader = jinja2.FileSystemLoader('.')
template = env.get_template('ClassicThesis.tex')

config = {
    'fontsize': '11pt',
    'paper': 'b5',
    'BCOR': '5mm',
    'language': 'english',
    'crop': 'a4',
    'table_of_contents': {
        'contents': True,
        'figures': False,
        'listings': False
    },
}

with open('./thesis_skeleton.latex', 'w') as f:
    f.write(template.render(**config))

