import sklearn.tree


reverse = lambda dictionary: {v: k for k, v in dictionary.items()}


TEXTURE_VALUES = {
    'smooth': 0,
    'bumpy': 1,
}


LABEL_VALUES = {
    'apple': 0,
    'orange': 1,
}


LABEL_DESCRIPTIONS = reverse(LABEL_VALUES)


########################################################


def new_classifier():
    training_data = [
        ([TEXTURE_VALUES['smooth'], 140], LABEL_VALUES['apple']),
        ([TEXTURE_VALUES['smooth'], 130], LABEL_VALUES['apple']),
        ([TEXTURE_VALUES['bumpy'],  150], LABEL_VALUES['orange']),
        ([TEXTURE_VALUES['bumpy'],  170], LABEL_VALUES['orange']),
    ]

    feature_sets = [e[0] for e in training_data]
    labels = [e[1] for e in training_data]

    classifier = sklearn.tree.DecisionTreeClassifier()
    classifier = classifier.fit(feature_sets, labels)
    return classifier


def main():
    classifier = new_classifier()

    possible_textures = "/".join(TEXTURE_VALUES.keys())

    while True:
        texture = input(f"Enter texture [{possible_textures}]: ")
        weight = input("Enter weight: ")

        feature_set = [TEXTURE_VALUES[texture], weight]
        prediction = LABEL_DESCRIPTIONS[classifier.predict([feature_set])[0]]

        print(f"\nPrediction: {prediction}")
        print(f"{'-' * 56}\n")


if __name__ == "__main__":
    main()
