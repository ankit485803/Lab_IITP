





import matplotlib.pyplot as plt
from collections import Counter
import re


def create_histogram(text):
    # Tokenize the text (using simple whitespace-based tokenization)
    tokens = re.findall(r'\b\w+\b', text.lower())  # Convert to lowercase for case-insensitive counting
      # Count the frequency of each word using Counter
    word_counts = Counter(tokens)
        # Plot the histogram
    plt.figure(figsize=(10, 5))
    plt.bar(word_counts.keys(), word_counts.values())
    plt.xlabel('Words')
    plt.ylabel('Frequency')
    plt.title('Histogram of Term Frequencies')
    plt.xticks(rotation=45)
    plt.show()


# Example text
text = "This is an example of a histogram representation for text. This example demonstrates how to create a histogram."
# Create and display the histogram
create_histogram(text)
