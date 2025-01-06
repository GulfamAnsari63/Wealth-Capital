import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            // Home Tab
            NavigationView {
                ZStack {
                    Color(hex: "#629f42")
                        .edgesIgnoringSafeArea(.top) // Extend to top
                    HomeView()
                }
            }
            .tabItem {
                createTabItem(icon: "house", label: "Home")
            }
            // Lead Tab
            NavigationView {
                ZStack {
                    Color(hex: "#629f42")
                        .edgesIgnoringSafeArea(.top)
                    LeadView()
                }
            }
            .tabItem {
                createTabItem(icon: "list.bullet", label: "Lead")
            }

            // Tasks Tab
            NavigationView {
                ZStack {
                    Color(hex: "#629f42")
                        .edgesIgnoringSafeArea(.top)
                    TaskListView()
                }
            }
            .tabItem {
                createTabItem(icon: "checkmark.circle.fill", label: "Tasks")
            }

            // Notification Tab
            NavigationView {
                ZStack {
                    Color(hex: "#629f42")
                        .edgesIgnoringSafeArea(.top)
                    NotificationView()
                }
            }
            .tabItem {
                createTabItem(icon:"bell.fill", label: "Notification")
            }

            // Account Tab
            NavigationView {
                ZStack {
                    Color(hex: "#629f42")
                        .edgesIgnoringSafeArea(.top)
                    AccountView()
                }
            }
            .tabItem {
                createTabItem(icon:"person", label: "Account")
                
            }
        }
        .accentColor(.white)
        .onAppear {
            setupTabBarAppearance()
            setupNavigationBarAppearance()
        }
    }
    private func createTabItem(icon: String, label: String) -> some View {
        VStack {
            Image(systemName:icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
            Text(label)
                .foregroundColor(.white)
        }
    }
    
    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(hex: "#629f42")

        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.7)
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white.withAlphaComponent(0.7)
        ]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 14.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }

    private func setupNavigationBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(hex: "#629f42")

        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var hexNumber: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&hexNumber)
        
        let r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hexNumber & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

// Preview
struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
