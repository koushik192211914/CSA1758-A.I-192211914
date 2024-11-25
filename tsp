##Aim:to solve the travelling salesman problem using python.
##Algorithm:
1. **Input**: A list of cities and the distances between each pair of cities.
2. **Initialize**: 
   - Create a variable to store the minimum cost found.
   - Create a variable to store the best route.
3. **Generate all possible routes**:
   - Use permutations to generate all possible orders of visiting the cities.
4. **Calculate the cost for each route**:
   - For each route, calculate the total distance by summing the distances between consecutive cities and returning to the starting city.
5. **Update the minimum cost and best route**:
   - If the calculated cost for a route is less than the current minimum cost, update the minimum cost and best route.
6. **Output**: Return the minimum cost and the best route found.
##Program:
from itertools import permutations

def calculate_route_cost(route, distance_matrix):
    cost = 0
    for i in range(len(route)):
        cost += distance_matrix[route[i]][route[(i + 1) % len(route)]]
    return cost

def traveling_salesman(distance_matrix):
    n = len(distance_matrix)
    cities = list(range(n))
    min_cost = float('inf')
    best_route = []

    for perm in permutations(cities):
        current_cost = calculate_route_cost(perm, distance_matrix)
        if current_cost < min_cost:
            min_cost = current_cost
            best_route = perm

    return min_cost, best_route

# Example distance matrix (symmetric)
distance_matrix = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

# Find the shortest path
min_cost, best_route = traveling_salesman(distance_matrix)

# Print results
print("Minimum Cost:", min_cost)
print("Best Route:", best_route)

##Sample Output:
Minimum Cost: 80
Best Route: (0, 1, 3, 2)
##Result:thus we solved travelling salesman problem using python.

