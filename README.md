# Logic Server: My own [TodoMVC](https://todomvc.com) of server-side code

**My question:** What language and platform should I use to build microservices?

To find out, I'm re-implementing some typical functions I'd need using many different frameworks.


## Code Comparsion

```Crystal
# Plaintext and HTML manipulation.
module TextService
  extend self

  #
  # Return a new string enhanced with typographic characters:
  #  Single quotes: ’
  #  Double quotes: “”
  #
  def add_typography(text : String) : String
    text.gsub(/"([^"]+)"/, "“\\1”")
        .gsub('\'', '’')
  end


  #
  # Add nicer typography that HTML can provide:
  #  Fractions using superscript and subscript.
  #
  def add_html_typography(text : String) : String
    text.gsub(%r{\b(\d+)/(\d+)\b}, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end
end
```

```python
import re

DOUBLE_QUOTED_TEXT = re.compile(r'"([^"]+)"')       # "Hello"
FRACTION           = re.compile(r'\b(\d+)/(\d+)\b') # 1/2


def add_typography(text: str) -> str:
    """ Return a new string enhanced with typographic characters:
          Single quotes: ’
          Double quotes: “”
    """
    return DOUBLE_QUOTED_TEXT.sub(r'“\1”', text).replace("'", "’")


def add_html_typography(text: str) -> str:
    """ Add nicer typography that HTML can provide:
          Fractions using superscript and subscript.
    """
    return FRACTION.sub(r'<sup>\1</sup>&frasl;<sub>\2</sub>', text)
```
