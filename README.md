# Xplor Robot

## Background

We are inventing an Xplor child care robot that could take care of some of the
basic tasks an educator does on a daily basis: nappy changes and sleep checks, etc.

## Rules

- Given a baby room with a grid
- There is one Xplor robot in the room
- There are multiple babies in the room
- The robot moves on the grid to perform tasks
- The robot starts at origin (bottom left of the grid), i.e. 0,0
- The babies all have different needs (i.e. the robot needs to perform different tasks on them)
- Robot’s movements:
  - Each movement from one cell to another on the grid takes one turn
  - Each task takes one turn (moving from one grid to another, and performing a task, in this case would consume two turns)
  - Switching between different types of tasks to perform also takes one turn (e.g. after having completed nappy change, moving from cell 1,1 to 2, 2 to perform sleep check will take a total of 4 turns - 2 turns for movement, 1 turn for task switching and 1 turn for performing the task itself)

## The Challenge

Calculate the number of turns required for the robot to complete all tasks for
all babies.

## The Baby Room

<table>
  <tr>
    <td width="20%"><br /><br /><br /><br /></td>
    <td width="20%"></td>
    <td width="20%"></td>
    <td width="20%"></td>
    <td width="20%"></td>
  </tr>
  <tr>
    <td width="20%"><br /><br /><br /><br /></td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Sleep check</li>
        <li>Food</li>
      </ul>
    </td>
    <td width="20%"><br /><br /><br /><br /></td>
    <td width="20%"></td>
    <td width="20%"></td>
  </tr>
  <tr>
    <td width="20%"><br /><br /><br /><br /></td>
    <td width="20%"></td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Nappy change</li>
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
    <td width="20%"><br /><br /><br /><br /></td>
    <td width="20%">
      <strong>Baby</strong>
      <ul>
        <li>Nappy change</li>
        <li>Sleep check</li>
      </ul>
    </td>
    <td width="20%"></td>
    <td width="20%"></td>
    <td width="20%"></td>
  </tr>
  <tr>
    <td width="20%"><strong>ROBOT</strong><br /><br /><br /><br /></td>
    <td width="20%"></td>
    <td width="20%"></td>
    <td width="20%"></td>
    <td width="20%"></td>
  </tr>
</table>

## Solution

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
