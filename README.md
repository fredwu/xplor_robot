# Xplor Robot

## Intro

We are inventing an Xplor child care robot that could take care of the basic
tasks an educator does on a daily basis, such as nappy changes and sleep checks, etc.

## Rules

- Given a baby room in a grid layout, shown below
- There is one and only one Xplor robot in the room
- There are multiple babies in the room
- The babies all have different needs, i.e. the robot needs to perform different tasks on them

### Robot’s Movement Rules

- The robot starts at origin (bottom left of the grid), i.e. `0, 0`
- The robot moves on the grid to perform tasks, it can only move in left, right, up and down, no diagonal movements are allowed
- Each movement from one grid cell to another takes one turn
- Each task takes one turn to complete, e.g. moving from one grid cell to another, then performing a task, in this case would consume two turns
- Switching between different types of tasks to perform also takes one turn, e.g. after having completed nappy change, moving from cell `1, 1` to `2, 2` to perform sleep check will take a total of 4 turns - 2 turns for movement, 1 turn for task switching and 1 turn for performing the task itself

## The Baby Room

<table>
  <tr>
    <td width="20%"><br /><br /><br /><br /><br /></td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Sleep check</li>
        <li>Food</li>
      </ul>
    </td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Nappy change</li>
        <li>Sleep check</li>
      </ul>
    </td>
    <td width="20%"></td>
  </tr>
  <tr>
    <td width="20%"><br /><br /><br /><br /><br /></td>
    <td width="20%"></td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Nappy change</li>
      </ul>
    </td>
    <td width="20%"></td>
  </tr>
  <tr>
    <td width="20%"><br /><br /><br /><br /><br /></td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Nappy change</li>
        <li>Sleep check</li>
      </ul>
    </td>
    <td width="20%"></td>
    <td width="20%"></td>
  </tr>
  <tr>
    <td width="20%"><strong>ROBOT</strong><br /><br /><br /><br /><br /></td>
    <td width="20%"></td>
    <td width="20%"></td>
    <td width="20%"></td>
  </tr>
</table>

## The Challenge

Calculate the number of turns required for the robot to complete all tasks for
all babies.

Bonus: Calculate the most optimal path for the robot to complete all tasks, i.e.
the robot completes all tasks using the least amount of turns.

### Required Outputs

1. The number of turns
2. The path that the Xplor robot walked

> Note: there is no defined structure for how the path should be output or displayed, as long as it clearly demonstrates __how__ you got to the number of turns result.

---

## Reference Solution

Brute Force.™

### Run test suite

```
mix test
```

### Run test suite with the shortest path output

```
mix test --include inspect
```

## Copyleft

Licensed under [MIT](http://fredwu.mit-license.org/).
