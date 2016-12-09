import defaultState from "../store/default-state";
import movePiece from "./move-piece";

const chessBoardReducer = (state = defaultState, action) => {
  switch (action.type) {
    case "SET_BOARD":
      return Object.assign({}, state, { board: action.board });

    case "SET_GAME_ID":
      return Object.assign({}, state, { gameId: action.gameId });

    case "MOVE_PIECE":
      const newState = {
        board: movePiece(state.board, action.from, action.to),
        selectedSquare: null
      }

      return Object.assign({}, state, newState);

    case "SELECT_PIECE":
      return Object.assign({}, state, { selectedSquare: action.coords });

    default:
      return state;
  }
}

export default chessBoardReducer;