{#

{% set my_cool_string = 'wow! cool!' %}
{% set my_second_string = 'this is jinja!' %}
{% set my_cool_number = 100 %}

{{ my_cool_string }} {{ my_second_string }} I want to write Jinja for {{ my_cool_number }} years!

{% set my_animals = ['lemur', 'wolf', 'panther', 'tardigrade'] %}

{{ my_animals[0] }}
{{ my_animals[1] }}
{{ my_animals[2] }}
{{ my_animals[3] }}

{% for animal in my_animals %}
    My favorite animal is the {{ animal }}
{% endfor %}

{% set temperature = 45 %}

{% if temperature < 65 %}
    Time for a cappuccino!
{% else %}
    Time for a cold brew!
{% endif %}

{%- set foods = ['carrot', 'hotdog', 'cucumber', 'bell pepper'] -%}

{% for food in foods %}
    {%- if food == 'hotdog' -%}
        {%- set food_type = 'snack' -%}
    {%- else -%}
        {%- set food_type = 'vegetable' -%}
    {%- endif -%}

The humble {{ food }} is my favorite {{ food_type }}

{% endfor %}

{% set websters_dict = {
    'word': 'data',
    'speech_part': 'noun',
    'definition': 'if you know you know'
} %}

{{ websters_dict ['word'] }} ({{ websters_dict['speech_part']}}): defined as "{{ websters_dict }}"