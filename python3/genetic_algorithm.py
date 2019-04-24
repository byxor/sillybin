from fuzzywuzzy import fuzz
import random
import string
import statistics


def main():
    ##############################
    # Hyperparameters... I think
    ##############################

    input_string = "Wow, I have evolved!"
    input_string_length = len(input_string)

    population_size = 10000

    FITNESS_THRESHOLD_EXCEEDED = 0
    GENERATION_LIMIT_EXCEEDED = 1
    termination_reason = FITNESS_THRESHOLD_EXCEEDED

    number_of_generations = 1000
    fitness_threshold = 100

    percentage_to_select = 50
    probability_of_mutation = 0.03

    ##############################
    
    agents = create_agents(population_size, input_string_length)

    generation = 0
    while True:
        agents = evaluate_fitness(agents, input_string)
        agents = select_fittest(agents, percentage_to_select)

        print(f'"{agents[0].string}" - (Generation: {generation}, Fitness: {agents[0].fitness})')

        agents = create_offspring(agents, population_size, input_string_length)
        agents = mutate(agents, probability_of_mutation, input_string_length)

        if termination_reason == FITNESS_THRESHOLD_EXCEEDED:
            if any(agent.fitness >= fitness_threshold for agent in agents):
                print('Fitness threshold reached!')
                exit(0)

        if termination_reason == GENERATION_LIMIT_EXCEEDED:
            if generation >= number_of_generations:
                print('Maximum number of generations reached.')
                exit(0)

        generation += 1


# Creation
def create_agents(population_size, string_length):
    return [Agent(string_length) for _ in range(population_size)]


# Fitness
def evaluate_fitness(agents, input_string):
    for agent in agents:
        agent.fitness = fuzz.ratio(agent.string, input_string)
    return agents


# Selection
def select_fittest(agents, percentage_to_select):
    agents = sorted(agents, key=(lambda agent: agent.fitness), reverse=True)
    number_to_select = int(percentage_to_select * 0.01 * len(agents))
    agents = agents[:number_to_select]
    return agents


# Crossover
def create_offspring(agents, population_size, input_string_length):
    offspring = []

    foo = int((population_size - len(agents)) / 2)
    for _ in range(foo):
        parent1, parent2 = random.sample(agents, 2)

        child1 = Agent(input_string_length)
        child2 = Agent(input_string_length)

        split = random.randint(0, input_string_length)
        child1.string = parent1.string[:split] + parent2.string[split:input_string_length]
        child2.string = parent2.string[:split] + parent1.string[split:input_string_length]

        offspring.append(child1)
        offspring.append(child2)

    agents.extend(offspring)

    return agents


# Mutation
def mutate(agents, probability_of_mutation, input_string_length):
    for agent in agents:
        for i, param in enumerate(agent.string):
            should_mutate = random.uniform(0.0, 1.0) <= probability_of_mutation
            if should_mutate:
                agent.string = agent.string[0:i] + _random_letter() + agent.string[i+1:input_string_length]
    return agents


class Agent:
    def __init__(self, string_length):
        self.string = ''.join(_random_letter() for _ in range(string_length))
        self.fitness = -1

    def __str__(self):
        return f'String: "{self.string}", Fitness: {self.fitness}'


def _random_letter():
    return random.choice(string.ascii_letters + ' /1234567890.,!?')
                

if __name__ == '__main__':
    main()
