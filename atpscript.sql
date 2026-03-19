-- ============================================================================
-- ATP MySQL Database - Script Completo
-- ============================================================================
USE atp
-- ============================================================================
-- LIMPEZA DE COLUNAS DESNECESSÁRIAS
-- ============================================================================


ALTER TABLE `players`
  DROP `_id`,
  DROP `countrycode`;

ALTER TABLE `player_per_game`
  DROP `player_mongo_id`,
  DROP `tournament_mongo_id`;

ALTER TABLE `tournaments`
  DROP `_id`,
  DROP `countrycode`;


-- ============================================================================
-- ÍNDICES
-- ============================================================================

-- Índices para a tabela players
CREATE INDEX idx_players_country_id ON players(country_id);
CREATE INDEX idx_players_fronthand ON players(fronthand);
CREATE INDEX idx_players_country_fronthand ON players(country_id, fronthand);

-- Índices para a tabela tournaments
CREATE INDEX idx_tournaments_country_id ON tournaments(country_id);
CREATE INDEX idx_tournaments_grand_slam ON tournaments(grand_slam);
CREATE INDEX idx_tournaments_ground ON tournaments(ground);
CREATE INDEX idx_tournaments_grand_slam_id ON tournaments(grand_slam, id);
CREATE INDEX idx_tournaments_ground_id ON tournaments(ground, id);

-- Índices para a tabela player_per_game
CREATE INDEX idx_ppg_player_id ON player_per_game(player_id);
CREATE INDEX idx_ppg_tournament_id ON player_per_game(tournament_id);
CREATE INDEX idx_ppg_wl_bool ON player_per_game(wl_bool);
CREATE INDEX idx_ppg_player_wl ON player_per_game(player_id, wl_bool);
CREATE INDEX idx_ppg_tournament_player_wl ON player_per_game(tournament_id, player_id, wl_bool);

-- Índice para a tabela countries (já deve ter PK, mas garantir)
CREATE INDEX idx_countries_id ON countries(id);