#pragma once
#include "Core.h"
#include "Window.h"

namespace GameEngine {
	class GE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// to be define in CLIENT
	Application* CreateApplication();
}


